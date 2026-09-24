# Power Fx and form controls
[Power Apps portfolio](README.md)

**Independently written illustrations, not proprietary source code.** Generic names replace application-specific controls and fields. These snippets require adaptation and testing in Power Apps; no runnable app package is supplied.

## Group-backed preparer selection

Reviewed configuration demonstrated a required, single-select ComboBox reading Microsoft 365 group members, displaying/searching the name, and mapping a selection to a SharePoint Person field.

Illustrative `cmbPreparer.Items`:

```powerfx
Office365Groups.ListGroupMembers(varPreparerGroup, {'$top': 100}).value
```

Configure `SelectMultiple = false`, `DisplayFields = ["displayName"]`, and `SearchFields = ["displayName"]`. Supply `varPreparerGroup` through approved environment-specific configuration; no real group identifier belongs in a public example.

This is a single-page illustration. It is not a complete directory loader. Handle all required pages and connector errors before treating results as the eligible population. Microsoft documents a canvas gallery pagination limitation for this connector; a larger page request must not be assumed to remove pagination requirements. [Connector reference](https://learn.microsoft.com/en-us/connectors/office365groups/)

## SharePoint Person mapping

Illustrative preparer data-card `Update`:

```powerfx
With(
    { selectedPerson: cmbPreparer.Selected },
    If(
        IsBlank(selectedPerson.mail),
        Blank(),
        {
            Claims: "i:0#.f|membership|" & Lower(selectedPerson.mail),
            DisplayName: selectedPerson.displayName,
            Email: selectedPerson.mail
        }
    )
)
```

This illustrates the mapping observed in the reviewed control. Confirm the expected record type in the actual generated data card; some configurations require additional properties. Do not substitute a display name for a stable identity. Users without an appropriate mail value require an explicit supported identity policy.

Directory records and saved SharePoint Person records use different property names. Normalize an existing selection into the ComboBox item shape and test `DefaultSelectedItems`; assigning the stored record directly may not display correctly. A removed group member on an old request also needs an explicit business rule.

## Save and error feedback

For a **single-form example** named `frmRequest`, initialize `varSaving` to false. Keep the submit control disabled while saving.

```powerfx
// Submit button OnSelect
If(
    !varSaving,
    If(
        frmRequest.Valid,
        Set(varSaving, true);
        SubmitForm(frmRequest),
        Notify("Complete the required fields.", NotificationType.Warning)
    )
)
```

```powerfx
// frmRequest.OnSuccess
Set(varSaving, false);
Notify("Request saved.", NotificationType.Success)
```

```powerfx
// frmRequest.OnFailure
Set(varSaving, false);
Notify("The request could not be saved. Review the form and try again.", NotificationType.Error)
```

Display card/form errors through an appropriate error label while preserving entered data. A saved request is not proof that downstream processing completed. Navigation or downstream app-triggered work belongs after confirmed save, not immediately after initiating an asynchronous submission. [Microsoft form-function reference](https://learn.microsoft.com/en-us/power-platform/power-fx/reference/function-form)

These snippets do not implement a multi-screen draft model. An eight-screen app requires deliberate validation and persistence across all participating forms; validating one form does not validate the other screens. The disabled button reduces repeated clicks but is not a server-side duplicate guarantee.

## Accessible feedback and authorization

The reviewed preparer control included field-level error text and a required indicator. Test keyboard interaction, accessible labels, focus behavior, error announcements, and readable validation. Enforce permissions at the list/service boundary; picker filtering and hidden controls are experience features, not security boundaries.

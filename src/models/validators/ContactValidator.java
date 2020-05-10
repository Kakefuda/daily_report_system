package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Contact;

public class ContactValidator {
    public static List<String> validate(Contact c) {
        List<String> errors = new ArrayList<String>();

        String name_error = _validateName(c.getName());
        if(!name_error.equals("")) {
            errors.add(name_error);
        }

        return errors;
    }

    private static String _validateName(String name) {
        if (name == null || name.equals("")) {
            return "企業名を入力して下さい。";
        }

        return "";
    }

}

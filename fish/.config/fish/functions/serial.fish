function serial --description 'Alias for panicleap-cas serial-SSH session'
    switch (echo $argv | tr '[:upper:]' '[:lower:]')
    case r400-10gbaset
        set port 1
    case portwell27
        set port 2
    case m25-vsvys
        set port 3
    case m35-4hyhj
        set port 4
    case m25-ztyqq
        set port 5
    case r45-lft7b
        set port 6
    case r45-cyb8e
        set port 22
    case r40-hvpwn
        set port 23
    case r45-oslu2
        set port 24
    case r40-ocm7e
        set port 30
    case m35-xezpq
        set port 31
    case portwell52
        set port 32
    end
    ssh admin:(math 7000 + $port)@panicleap-cas
end

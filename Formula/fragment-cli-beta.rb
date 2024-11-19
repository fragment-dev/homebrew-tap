require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5798.0.0-darwin-x64.tar.gz"
    sha256 "aaca8466142ca39477ff199f4bccf046c9be84adc0a0b8064c34e242b392328a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5798.0.0-darwin-arm64.tar.gz"
      sha256 "3c7bd2d82a639f4fff5105b570910c834d741edfa0cb5e1a9074a19d6285d25c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5798.0.0-linux-x64.tar.gz"
    sha256 "dc15f8fd72943cd6b7506d7cc0d70d342f2b104b6f0ffe3c0a2adde0112b414c"
  end
  version "5798.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end

require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3483.0.0-darwin-x64.tar.gz"
    sha256 "2d8b13a24ceac92338bdd58ef768d7ddf333bf632d2351ffd5c5c7ba047d3386"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3483.0.0-darwin-arm64.tar.gz"
      sha256 "c74a9c572f787df2af75f120a5164a6850f3f28e26aec7a14ec7690d76b9cc61"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3483.0.0-linux-x64.tar.gz"
    sha256 "ba707d2c3f6115634f2b2cb7f57f509b32a57e7fb386624ed843d7219d84d682"
  end
  version "3483.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end

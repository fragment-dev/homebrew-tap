require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3543.0.0-darwin-x64.tar.gz"
    sha256 "1561ea33102546f4b17c5c5ee8964e4b8b98fa95d01512bd86449ac0982d49c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3543.0.0-darwin-arm64.tar.gz"
      sha256 "6b072429d39b17936593241ac6c0b94235e05d037d14864ae09ca168278a6c1c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3543.0.0-linux-x64.tar.gz"
    sha256 "93a6f427c25913164958f27a877fb8dc859d9963e308a73c564d82e47479b0a2"
  end
  version "3543.0.0"
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

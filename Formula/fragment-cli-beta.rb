require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5593.0.0-darwin-x64.tar.gz"
    sha256 "acb7f10289476ddcb549bfbb63f41bce33037f3949f3503088768062971f0d39"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5593.0.0-darwin-arm64.tar.gz"
      sha256 "5ca06b387e66465adbaf84721285e318949a6903dea9672af14ea4a1a3b74f81"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5593.0.0-linux-x64.tar.gz"
    sha256 "4465239c4c05494585538caae0881a7f97caff3a89d1aef1467566ac6580727b"
  end
  version "5593.0.0"
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

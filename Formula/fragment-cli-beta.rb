require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4831.0.0-darwin-x64.tar.gz"
    sha256 "f5e04f787766b1f1d861415ea25846b0d4bfa87edec0c48270b0c7a21e2f8af4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4831.0.0-darwin-arm64.tar.gz"
      sha256 "e7133f6a7ec53646210c006783c3485f9a245fac58dbc5ef9618e91d9995f6e1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4831.0.0-linux-x64.tar.gz"
    sha256 "ff5ec736b4d64b1b10a6a9ac5b9ca11129927251b2df32a03c35f6714c55897c"
  end
  version "4831.0.0"
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

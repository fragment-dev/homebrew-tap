require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4555.0.0-darwin-x64.tar.gz"
    sha256 "4c1c6703df22614f75c9cf412871b69162f6d6a6766c45eab17403625873d3c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4555.0.0-darwin-arm64.tar.gz"
      sha256 "c854d77e607e64f81914a456bc470ae71e696810cee39d7f3dfbde0752ba0d5c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4555.0.0-linux-x64.tar.gz"
    sha256 "4fea84d795d8e64d83af2bde911a50cb4953d81065eea9fe07b6a243246da96d"
  end
  version "4555.0.0"
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

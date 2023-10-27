require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3917.0.0-darwin-x64.tar.gz"
    sha256 "2265e4ffb5a446a4ba639239f264602211a94f2b4130183123d36e40c10cf141"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3917.0.0-darwin-arm64.tar.gz"
      sha256 "5fe381767f98f263831226e863cbbf1caadd0dced80637e0980eb5883d53336b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3917.0.0-linux-x64.tar.gz"
    sha256 "5b0c40260082d3f0100e0f9dae514e1aa993ecd7f90f89ac97f739f4e690932c"
  end
  version "3917.0.0"
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

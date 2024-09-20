require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5611.0.0-darwin-x64.tar.gz"
    sha256 "601393f0991314fdd802e704076c57f6e97d850a76284f22a9ec110d862ba362"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5611.0.0-darwin-arm64.tar.gz"
      sha256 "be601081b3f8100a2de5986910c893f466d66aae10b97b3c9cebd9c397587de5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5611.0.0-linux-x64.tar.gz"
    sha256 "9935c83fa4be7fcc1aa31bc36110ff75a0ced664be46cef67c5284d7630cc4e3"
  end
  version "5611.0.0"
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

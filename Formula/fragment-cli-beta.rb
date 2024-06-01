require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5171.0.0-darwin-x64.tar.gz"
    sha256 "094fe73f6f8872ad4c81a061a69b3c7062f0c84e1b2b560d520f2b5241c3e96b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5171.0.0-darwin-arm64.tar.gz"
      sha256 "29831397b4aaf1ff5ef241a56e420c50ac368c74cb1c094c2c3f2ca3ef5a9ac1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5171.0.0-linux-x64.tar.gz"
    sha256 "f05a82617995773a3d2c5b3739490b5b01d19d317849b4602050b219606a45d5"
  end
  version "5171.0.0"
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

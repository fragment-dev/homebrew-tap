require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4444.0.0-darwin-x64.tar.gz"
    sha256 "89f35635ed90b46897f860921db448feda1bf892e75a5112df13e778ee73b220"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4444.0.0-darwin-arm64.tar.gz"
      sha256 "401bde885a15136e999b7dfea613d2cf3d27ff41df447212e7a0c8c9e2e5ed56"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4444.0.0-linux-x64.tar.gz"
    sha256 "c04d9381b8a94dc53f0056a7e3f3a0d85aeac8444d8a8107ca78fd972aa1f5fe"
  end
  version "4444.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end

require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4047.0.0-darwin-x64.tar.gz"
    sha256 "5f6d2c175df65ce4aa6936c8e01cdd9bbce837810c11a7730fcc03645dfb208a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4047.0.0-darwin-arm64.tar.gz"
      sha256 "ee90a5bfe3bcc62000447ced01611209cc93e086035188111da806c7c09458b7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4047.0.0-linux-x64.tar.gz"
    sha256 "96e4576908864d6812a9a5c32aa45dbe0f38f5920d5972ab857c56fea6f564c2"
  end
  version "4047.0.0"
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

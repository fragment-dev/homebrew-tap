require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4539.0.0-darwin-x64.tar.gz"
    sha256 "63f2bdb5fa3e996d029ee2ea0b52582147aaf0579e82536d9bd691c5755dd45c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4539.0.0-darwin-arm64.tar.gz"
      sha256 "18fc0ea4420f8168bb76abae614131dbda37a54ea0a11387bbdf4384ee9228b9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4539.0.0-linux-x64.tar.gz"
    sha256 "055efb3be275cf7091c7df16c4113ebd827887cbd69a05db6adc0f76a72fe3d4"
  end
  version "4539.0.0"
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

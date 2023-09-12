require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3534.0.0-darwin-x64.tar.gz"
    sha256 "16fb68887000e2fdf08cbf211bfee82d19c0fb337be7d1aff64fb8ebd0dc0f23"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3534.0.0-darwin-arm64.tar.gz"
      sha256 "f2b34a31ce3f34af5e6af089314b640b2e9e73ee13ff434c33eba6f0e1f2aaf3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3534.0.0-linux-x64.tar.gz"
    sha256 "4cd9c49d7125e4d3dfcb3bb57627fea29ce3c892fd489cb6ac54dba2464f8007"
  end
  version "3534.0.0"
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

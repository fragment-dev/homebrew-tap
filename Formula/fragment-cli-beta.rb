require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5141.0.0-darwin-x64.tar.gz"
    sha256 "04f6a2cdf43b4c2edf7405c4dce9c25f7f0dcb39212fc15fb18621f510272892"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5141.0.0-darwin-arm64.tar.gz"
      sha256 "b184d17179230eb23b4c6f5f504e34f81eac45d05c5833d481593ccad5e4ac73"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5141.0.0-linux-x64.tar.gz"
    sha256 "29b66a5f9ed6162b474920bfdf3588bfd177a084c0aab5e1a80ecfd8749456aa"
  end
  version "5141.0.0"
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

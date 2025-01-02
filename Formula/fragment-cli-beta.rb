require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6023.0.0-darwin-x64.tar.gz"
    sha256 "d11ac00e88daef332aefefae08cf21117aec92db0b00e163b054c97b5179dc43"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6023.0.0-darwin-arm64.tar.gz"
      sha256 "b815162af8e4bc7b6e3651ea956bace095f10c14c78398d179d7532c49b7fb8a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6023.0.0-linux-x64.tar.gz"
    sha256 "d076de0c54b0b29cbe121c950f50aaca6627414e8dad67dfbe1158f873250d9a"
  end
  version "6023.0.0"
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

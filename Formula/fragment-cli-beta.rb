require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4227.0.0-darwin-x64.tar.gz"
    sha256 "a3803a893a552b9fe75ec25eeaf994992114e5788c57d73597c3521f408677f5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4227.0.0-darwin-arm64.tar.gz"
      sha256 "5ea20974326b9372d956a68193e535d9e0568aaac4c6439d34ee602328a53a49"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4227.0.0-linux-x64.tar.gz"
    sha256 "55516b8e09843389394201c572904619066526d2346cb4f3724ab95ee86cdd95"
  end
  version "4227.0.0"
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

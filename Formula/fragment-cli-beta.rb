require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6098.0.0-darwin-x64.tar.gz"
    sha256 "5e5526e43fab916f30abe4b75ad197c6cd593d9627a5768e31fd1530cd3043ee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6098.0.0-darwin-arm64.tar.gz"
      sha256 "0cfcd33536af43f28e0b053edbc747578b4c2dfa8f67043a4c1bbe09e195e733"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6098.0.0-linux-x64.tar.gz"
    sha256 "1525d71682592daba32ca39088f82680c34cc67dbb91f691eccfa1bf471d2e77"
  end
  version "6098.0.0"
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

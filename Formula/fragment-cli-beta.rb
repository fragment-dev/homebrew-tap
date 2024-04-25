require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4943.0.0-darwin-x64.tar.gz"
    sha256 "a7e46da0a1d078b98c8e15cb11042192fe4d7ad991ee70ad8f16f01a77daa105"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4943.0.0-darwin-arm64.tar.gz"
      sha256 "7f56837b148549c11d0377cbc954f971fa3c1cf1a5a828505ec4d6f543e51218"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4943.0.0-linux-x64.tar.gz"
    sha256 "40541dce582358d4290cfb62acf2411e23949f82c55e4d6fa1a78e72d38f9d2f"
  end
  version "4943.0.0"
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

require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4996.0.0-darwin-x64.tar.gz"
    sha256 "ad1df0f9e1a3541e3b548d328ef091870db60ffc43445ba3d00a7c2894a362df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4996.0.0-darwin-arm64.tar.gz"
      sha256 "acd5bdce610bf619c7ebe66eae9c6452df35da5265e542dd6570d6865267bb97"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4996.0.0-linux-x64.tar.gz"
    sha256 "1f484b83b3287bc8d51cae192eab83eb9a8f6a579e5e411d99694e2e96e24050"
  end
  version "4996.0.0"
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

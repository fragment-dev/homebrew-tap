require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5208.0.0-darwin-x64.tar.gz"
    sha256 "1a4c7e6e494f4c46ff43c27f6192578049784df8ad46418e6447c8bfac562e55"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5208.0.0-darwin-arm64.tar.gz"
      sha256 "98a79873bb1ca4ecf3c5177e9822694cb563eee8e55b298e865bf8bd041381af"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5208.0.0-linux-x64.tar.gz"
    sha256 "682728ae0536aa6dff1ef8dc0be91b895bec15ede046aaab3bf6689b2e40100f"
  end
  version "5208.0.0"
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

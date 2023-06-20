require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2888.0.0-darwin-x64.tar.gz"
    sha256 "d7ba74bba60338320e2e4e99aea6ded9bb546f6163e1438195d2c1e3a72d7c68"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2888.0.0-darwin-arm64.tar.gz"
      sha256 "21ae0b0a8e44f7274c0e831acfc9d684e05922b7f2fa3ba1e34d06356133dd74"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2888.0.0-linux-x64.tar.gz"
    sha256 "aa8c3c363c9d428110f2dcab409edc8e03264c89acd9ba277a0a2a2d0262932c"
  end
  version "2888.0.0"
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

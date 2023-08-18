require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3344.0.0-darwin-x64.tar.gz"
    sha256 "3cf168660214737ec77cbd6b109d75347f9901474aefcf2ca6d172b283168028"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3344.0.0-darwin-arm64.tar.gz"
      sha256 "c9c5a184312d07e24f36f295793a1c2e3570b47cfc3845fcc83d6e2cda945875"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3344.0.0-linux-x64.tar.gz"
    sha256 "6857d7e76a28a20a40167989d5c3adbf283f851f27d0a31fa73fd9b48c0e45fa"
  end
  version "3344.0.0"
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

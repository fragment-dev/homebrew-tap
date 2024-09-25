require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5621.0.0-darwin-x64.tar.gz"
    sha256 "b063c449256e971aeb96be0e2df92a86683a4bc9b7415a968c4774bf9a2e3ca5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5621.0.0-darwin-arm64.tar.gz"
      sha256 "05579eb58e45f46895dc72e1450713885c2e524d5fde808140c06f125f1854b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5621.0.0-linux-x64.tar.gz"
    sha256 "a24dcafe3cd4b13ca12b2c6cd56b5bc7c7f2b8a86bba0a7787c4ee80cc1e9d24"
  end
  version "5621.0.0"
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

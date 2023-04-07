require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2382.0.0-darwin-x64.tar.gz"
    sha256 "bab404d8a77ca3367cf9e70789b3862bf4a5341d7b43fa7c1dd8a2fa577531da"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2382.0.0-darwin-arm64.tar.gz"
      sha256 "cdde9d6508a8377f8045884ee1dd91564e9768fe0815d9be8b87fa546ceb5581"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2382.0.0-linux-x64.tar.gz"
    sha256 "82cd5db935d0c0a75f8d5ee6a1af9d3fd1926b3f7ebcc606df6897b82b11511d"
  end
  version "2382.0.0"
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

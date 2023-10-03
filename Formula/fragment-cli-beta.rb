require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3741.0.0-darwin-x64.tar.gz"
    sha256 "66a0f67beff5f5b1668e1209b7959e8d3c395a0625c52d000fe35d452f38bc0a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3741.0.0-darwin-arm64.tar.gz"
      sha256 "6ffb1b5da29b463ac32d0e0acd327761ee99e389e3d5a86c1e149e76424d74a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3741.0.0-linux-x64.tar.gz"
    sha256 "44157e323748626cfecc0ffd83412330ba77a5e627e06f4d9505d80e4434ec7d"
  end
  version "3741.0.0"
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

require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3594.0.0-darwin-x64.tar.gz"
    sha256 "ef3adf5b45a82769c722c942a32c8c249479d5be3d157b7fe2196612a6ad45df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3594.0.0-darwin-arm64.tar.gz"
      sha256 "61c24922f42bda3c0121b952394f42dba15a05c3a97261c49dff9089450626e8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3594.0.0-linux-x64.tar.gz"
    sha256 "875c00e3ca30bf2b67d922a6a7387c5589d67fabcffeb1a790b88ffa3e4400a7"
  end
  version "3594.0.0"
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

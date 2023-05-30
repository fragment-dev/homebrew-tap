require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2760.0.0-darwin-x64.tar.gz"
    sha256 "59f90e5801794f1e9cc57b6294217584e7885c8dee948feb63244ff2f4835d66"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2760.0.0-darwin-arm64.tar.gz"
      sha256 "1a33ea6047d6a04fc1fa75cd0678cb01793ac47fd5a62e7140b8ff7b2467b648"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2760.0.0-linux-x64.tar.gz"
    sha256 "0f219532076ce5f413416971acc0518e5f4c9a02eaeb5292d30e18d05c8dc5e1"
  end
  version "2760.0.0"
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

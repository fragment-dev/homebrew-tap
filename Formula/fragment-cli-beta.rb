require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3817.0.0-darwin-x64.tar.gz"
    sha256 "4f2771f20a25fa990d3844cae91e92d4f0b34383656caa058e86a17fc2df392d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3817.0.0-darwin-arm64.tar.gz"
      sha256 "3e4a76dc33577cddaa44c51f29685d804298a74737505b4cc7e9b93b4e737b88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3817.0.0-linux-x64.tar.gz"
    sha256 "02cc768b03aeb38c0b51b794c4b19a908b9c2f5a08df16452265cde7ab2e7f46"
  end
  version "3817.0.0"
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

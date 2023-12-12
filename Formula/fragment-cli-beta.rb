require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4139.0.0-darwin-x64.tar.gz"
    sha256 "89a82559f66b67014b44363d6687dc530b3b6cb75d98893c125240073581bf2e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4139.0.0-darwin-arm64.tar.gz"
      sha256 "0197f655322e63a84764898008668ac0468105717ba21c9d8413d98dc7bbd774"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4139.0.0-linux-x64.tar.gz"
    sha256 "ca910accd17f86b299ad5613fe927697147426bcb4422acb5d84735c63ff9249"
  end
  version "4139.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end

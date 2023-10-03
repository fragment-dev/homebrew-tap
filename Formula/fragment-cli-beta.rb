require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3747.0.0-darwin-x64.tar.gz"
    sha256 "76bcde857bdd3b552841263f34e11a3d5cd1c020a7c83ef4b9721af350c55294"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3747.0.0-darwin-arm64.tar.gz"
      sha256 "658ae8d2e84fff5b20b510ea1cebe5f5ee02ef51a336889ce5482e25a25b646c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3747.0.0-linux-x64.tar.gz"
    sha256 "b024005be6d98508046de9a951f3b0a050111de5c3cd8d450a45bbf594d39eea"
  end
  version "3747.0.0"
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

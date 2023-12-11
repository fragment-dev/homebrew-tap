require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4128.0.0-darwin-x64.tar.gz"
    sha256 "763ab2a8c37b7b6046e5e0e7a2564b6c067388fa1686d04768da3a37625a216f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4128.0.0-darwin-arm64.tar.gz"
      sha256 "57aafcb9963fb4f8796a6dc846102fdfd2b8c9d19ff5b6e047750ce321a3de66"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4128.0.0-linux-x64.tar.gz"
    sha256 "d7741582a89697c2fa07a609283392e65268b009e15e26074a129e06396b261d"
  end
  version "4128.0.0"
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

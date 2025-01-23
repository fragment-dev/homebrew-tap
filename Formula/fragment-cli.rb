require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.23-darwin-x64.tar.gz"
    sha256 "f5437724c0f41abc952a8248284095ab6e5e693120f3fab34b00caa10d9293f0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.23-darwin-arm64.tar.gz"
      sha256 "3b27d6c5939f3f0d7fcecb918b616b6832e883daaf314872301a025d48a79b01"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.23-linux-x64.tar.gz"
    sha256 "775e112b2a83753b6f1bb93aff80efb1443b491cc5e8900e8622f53cd0747aae"
  end
  version "2025.1.23"
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

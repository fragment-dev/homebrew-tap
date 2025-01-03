require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.3-darwin-x64.tar.gz"
    sha256 "60383770f48ea2e5842284f3fd0fb55d0f577b63a7d0d487d149a009f349fe2f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.3-darwin-arm64.tar.gz"
      sha256 "43b8bf39fdcc529ea94234f9059af48e16b8860dd0c4ef71d6ad149592c85ddf"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.3-linux-x64.tar.gz"
    sha256 "42c6d67abe4bb00e852b3e1faad486a82afd6280798ff153fe2210d6078cc613"
  end
  version "2025.1.3"
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

require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5492.0.0-darwin-x64.tar.gz"
    sha256 "58cdbe49a280fe80b24cc4980688d2a3b6fcdaf7ff22355d43b2e7769d615006"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5492.0.0-darwin-arm64.tar.gz"
      sha256 "833d652b85d65b2b5c875e74c88cb90325d41eecba8bbe338db66f630fe8ef7b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5492.0.0-linux-x64.tar.gz"
    sha256 "4d27cae99bd1d46e46de7b431fd0f30f0e7b5dc522323ad3021d4a3130b195bc"
  end
  version "5492.0.0"
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

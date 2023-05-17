require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2681.0.0-darwin-x64.tar.gz"
    sha256 "da17816b26f147e8583d46763566967da474386e56da5234e61314ea9e92f52c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2681.0.0-darwin-arm64.tar.gz"
      sha256 "a71d31cb3411ca9f970e02b9c899765713f337539a4d7fc69f7fe7a6bd889dfe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2681.0.0-linux-x64.tar.gz"
    sha256 "c09eeeba4b96470b444368e9c599b417f9986e50621a5c6bb27d6f6559909e1f"
  end
  version "2681.0.0"
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

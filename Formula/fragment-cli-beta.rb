require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3278.0.0-darwin-x64.tar.gz"
    sha256 "4e9190d76fea7ff62a40137b9ce9739cf5b2be3e1ded1a750aaefdecd3682136"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3278.0.0-darwin-arm64.tar.gz"
      sha256 "bcb2933f52034a2f89db0c25eb91fff4dc5582a691840a326b4f9a45cd7ff8ca"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3278.0.0-linux-x64.tar.gz"
    sha256 "e1b4e0f792e0dc8d9417d2c4f23d88c2dd0507404e2dae426a3334710adabe43"
  end
  version "3278.0.0"
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

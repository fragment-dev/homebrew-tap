require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2881.0.0-darwin-x64.tar.gz"
    sha256 "f932f050f9462b969b4bd2867ea8f9ffe755ee02623f03842f0e526bc3831b27"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2881.0.0-darwin-arm64.tar.gz"
      sha256 "9498200a873867f84d4b4c45a1186c6562c0589a005d6a527b23399d3dd155b5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2881.0.0-linux-x64.tar.gz"
    sha256 "ffa74e1a436ff645dca531765053902a6edaa5635b8f347867f19a3abd008901"
  end
  version "2881.0.0"
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

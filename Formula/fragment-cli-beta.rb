require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3098.0.0-darwin-x64.tar.gz"
    sha256 "11913f7c3ff1f4051b1c112d63cf111b5823e0e6524f55cd67738b772be450c6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3098.0.0-darwin-arm64.tar.gz"
      sha256 "cbc060199b039438ab14ec5865aaea6d71dcf19fc579e84f20929f64043f1ac4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3098.0.0-linux-x64.tar.gz"
    sha256 "a6fc266faed3e52c322f5ed048ab5f4adc3483e8841e2529f6ba971f3a6fc74a"
  end
  version "3098.0.0"
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

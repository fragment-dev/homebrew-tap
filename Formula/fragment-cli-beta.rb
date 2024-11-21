require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5821.0.0-darwin-x64.tar.gz"
    sha256 "7552a89346ddd137bd82067a0e0a6bfd87ab42a32032b7349fa6e6b47f0d4fd3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5821.0.0-darwin-arm64.tar.gz"
      sha256 "a7c4d9371f6246d77799938645556cc723e927e8fa8b9dc961e4856e669cca27"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5821.0.0-linux-x64.tar.gz"
    sha256 "9e449f43437edb5b42c8bbcf5053923c9506cb1bd4639d62166590e1dd3d8bd4"
  end
  version "5821.0.0"
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

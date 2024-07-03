require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5347.0.0-darwin-x64.tar.gz"
    sha256 "b48c96846df55b571317c6bf7a6b3e661a1d2026d0ca441aa5392171c121fb23"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5347.0.0-darwin-arm64.tar.gz"
      sha256 "fcb2f355a42078ff7ab5c3e8bf47d5dcc62e6b87dc49dc9b0151c9ed908108e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5347.0.0-linux-x64.tar.gz"
    sha256 "38644380b3822251bf60c5f1cc9652cd0f159a839877ec27c7cf4516f385f5b5"
  end
  version "5347.0.0"
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

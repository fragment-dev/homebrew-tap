require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3283.0.0-darwin-x64.tar.gz"
    sha256 "632dc33f2839f149f45a6cc394e837cf5bed6447db3db34d2da7ae8c0ea6a65b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3283.0.0-darwin-arm64.tar.gz"
      sha256 "2c4a93a77dd2307747fc0dc1ae90aa6b9d4c15a24218aa907f902bd4b36afbd7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3283.0.0-linux-x64.tar.gz"
    sha256 "0afffc17e9b7836a0763cc7e5b51bbe535c2b80a28d5bf6a99c2beb84502ba52"
  end
  version "3283.0.0"
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

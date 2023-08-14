require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3306.0.0-darwin-x64.tar.gz"
    sha256 "0b9c1eb8ca327f7166fd683a281b9513c713db46846d224528d21cc894494060"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3306.0.0-darwin-arm64.tar.gz"
      sha256 "8866a43a248ad7494b72b1f96111787948a3099bfde352fb675e4ff31151c43e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3306.0.0-linux-x64.tar.gz"
    sha256 "c6f51e26343039d31f45730da7dfed8cc31c86eb178c914b8d71e2e4a8313522"
  end
  version "3306.0.0"
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

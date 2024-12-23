require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5968.0.0-darwin-x64.tar.gz"
    sha256 "7bd3b82c50f725bb141fd93e89e38d5cd09e5acb21eb8d20f60c57c7cb9ec099"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5968.0.0-darwin-arm64.tar.gz"
      sha256 "c8e60d52250424bd4c7828623fc0324c5f25063c77026168cdbbca57b8376353"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5968.0.0-linux-x64.tar.gz"
    sha256 "293060b2d30bbda96471fd25b45c655355c10fa39a46f11d3f8190fcd4dc40b8"
  end
  version "5968.0.0"
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

require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2667.0.0-darwin-x64.tar.gz"
    sha256 "85abc0055c21f37bec86d7066f1c436a00f1ae655a0995f48d157ac77c1affd8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2667.0.0-darwin-arm64.tar.gz"
      sha256 "fcad4a0088a432d7ddd76a6f3d0e4dd0de2ef4569b8d8e5fabb4787d60eef995"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2667.0.0-linux-x64.tar.gz"
    sha256 "e638f8796161a6141bb23ae9471814dd756095e0f9f15d20f97922783784759a"
  end
  version "2667.0.0"
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

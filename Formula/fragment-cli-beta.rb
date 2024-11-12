require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5763.0.0-darwin-x64.tar.gz"
    sha256 "64c6783df4a7d8f7be89ecfef97c2ea14f6ece683cd8a103982fdc9bb6512a2e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5763.0.0-darwin-arm64.tar.gz"
      sha256 "e10eb08e122d02189bbfab7487f1c9b4457b13a9d6ca19e000b37d2881f00678"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5763.0.0-linux-x64.tar.gz"
    sha256 "d5b330a06ea517cbbd6573f720b6795f4817c9b0feecbe106bd5d5bb0931c05a"
  end
  version "5763.0.0"
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

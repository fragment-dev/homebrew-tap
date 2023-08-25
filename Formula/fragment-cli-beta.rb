require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3396.0.0-darwin-x64.tar.gz"
    sha256 "37315ec888f13b44180ea63e33b719b3b32035ab9dd0817c0e58afe17e11c461"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3396.0.0-darwin-arm64.tar.gz"
      sha256 "8954901d51a04de58d8ec4e9b0844a551bdd19f69d254d759c7ade35364446eb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3396.0.0-linux-x64.tar.gz"
    sha256 "b50afdaeda3d479c5b47e150403cfea133b73e8809d0e5f7a56e6701e586b8b9"
  end
  version "3396.0.0"
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

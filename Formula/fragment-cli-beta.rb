require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2691.0.0-darwin-x64.tar.gz"
    sha256 "3c331671591953578559355134c834761e8a2307181b348d90e5b89a00251eab"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2691.0.0-darwin-arm64.tar.gz"
      sha256 "081ea3dc83bb6ef50900e013a60cb47fa0c8d69eb4f02b73f88a1d80c05452fa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2691.0.0-linux-x64.tar.gz"
    sha256 "e3a6a55600084950ac5bce3f147bbbb65164337adaaefe6135c01f73e492321e"
  end
  version "2691.0.0"
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

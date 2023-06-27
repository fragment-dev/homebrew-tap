require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2937.0.0-darwin-x64.tar.gz"
    sha256 "57072d3c42dc2118242bb41ccecb4a440c5d2663a421541944581ac9b69dca36"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2937.0.0-darwin-arm64.tar.gz"
      sha256 "b84dd2161da9178296df6f081343e848a8f40e899e065ef83fd805a867207c29"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2937.0.0-linux-x64.tar.gz"
    sha256 "2df53f7bd5bcad9cc96bc5c03c3e73e2f1b0fe9666766927c79dc73634bf96aa"
  end
  version "2937.0.0"
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

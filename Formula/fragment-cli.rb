require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-3-darwin-x64.tar.gz"
    sha256 "253a1eebe8f1a6cf337f226e9b8e5cdf59ffb4d28dd4638c111341e37d973c31"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-3-darwin-arm64.tar.gz"
      sha256 "f26c2b2d0d98f85fca7348800b9d14af243b8569e8b2282dfc7f3464d668ea5a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-3-linux-x64.tar.gz"
    sha256 "a995a37d79b32f58eb547b53397c8d673703e821967468e2e41a62d504f614b4"
  end
  version "2024.6.3-3"
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

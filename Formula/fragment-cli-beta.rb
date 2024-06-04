require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5182.0.0-darwin-x64.tar.gz"
    sha256 "f94060f8fa53b2d5ccb712691c949da4932b772800e8f3023677614f9f1bb120"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5182.0.0-darwin-arm64.tar.gz"
      sha256 "20c9bf0994d92c5eeca6fd04fc0545515f8c0d918fdfda5387989b25b7a6b936"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5182.0.0-linux-x64.tar.gz"
    sha256 "d930f7a6936a3a4df98206a67dc22634f967adc7856884e8d1c4ae01c30cfa55"
  end
  version "5182.0.0"
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

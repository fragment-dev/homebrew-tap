require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5008.0.0-darwin-x64.tar.gz"
    sha256 "2ae84ecf6d2c8791dd0bfc53356c7d16467282a616429c325e8f25eccbe96c54"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5008.0.0-darwin-arm64.tar.gz"
      sha256 "247813215c0995295d9cbc59527e61259a5a84738e8eda3f0c2408c2add37002"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5008.0.0-linux-x64.tar.gz"
    sha256 "bab5a62d03eed35c536128aeb5d5f643d7c87b8e0088b1485bbd63105eeaf731"
  end
  version "5008.0.0"
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

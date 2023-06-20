require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2885.0.0-darwin-x64.tar.gz"
    sha256 "bb18205fa29fc3e78b16c20005799ea82a3ee5a896dfa40c8413136c76b50631"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2885.0.0-darwin-arm64.tar.gz"
      sha256 "dae72437bbe00e3ccb8a781ebc21089b65529581b9bdf0db9941a08555eacd22"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2885.0.0-linux-x64.tar.gz"
    sha256 "8b5214fcf8130adc7586fb9669b93236be73d8c93c9b187416c88d22500f28f3"
  end
  version "2885.0.0"
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
